class SightingsController < ApplicationController
    def index
        sightings = Sighting.all
        render json: sightings
    end

    def show
        sighting = Sighting.find_by(id: params[:id])
        if sighting
            render json: sighting, status: :ok
        else
            render json: {error: "Sighting not found."}, status: :not_found
        end
    end

    def create  #existing animal
        sighting = Sighting.create(sighting_params)
        if sighting.valid?
            generate_alerts(sighting_params[:animal_id], sighting.id)
            if params[:no_image]   #Default image
                sighting.image.attach(
                    io: File.open('./public/avatars/user.png'),
                    filename: 'user.png',
                    content_type: 'application/png'
                )
                render json: sighting, status: :created
            else    #custom image
                render json: sighting, serializer: SightingPreImageSerializer, status: :created
            end
        else
            render json: {errors: sighting.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def create_with_new_animal
        animal = Animal.create(common_name: sighting_with_new_params[:common_name], scientific_name: sighting_with_new_params[:scientific_name], description: sighting_with_new_params[:description])
        
        if animal.valid?
            sighting = Sighting.create(animal_id: animal.id, outing_id: sighting_with_new_params[:outing_id], environment: sighting_with_new_params[:environment], weather_conditions: sighting_with_new_params[:weather_conditions], notes: sighting_with_new_params[:notes])
            if sighting.valid?
                if params[:no_image]   #Default image
                    sighting.image.attach(
                        io: File.open('./public/avatars/user.png'),
                        filename: 'user.png',
                        content_type: 'application/png'
                    )
                    render json: {
                        sighting: ActiveModelSerializers::SerializableResource.new(sighting, serializer: SightingSerializer),
                        animal: ActiveModelSerializers::SerializableResource.new(animal, serializer: AnimalSerializer)
                    }
                else    #custom image
                    render json: {
                        sighting: ActiveModelSerializers::SerializableResource.new(sighting, serializer: SightingPreImageSerializer),
                        animal: ActiveModelSerializers::SerializableResource.new(animal, serializer: AnimalSerializer)
                    }
                end
                # render json: sighting, status: :created
            else
                render json: {errors: sighting.errors.full_messages}, status: :unprocessable_entity
            end
        else
            render json: {errors: animal.errors.full_messages}, status: :unprocessable_entity
        end

    end
    
    def generate_alerts(animal_id, sighting_id)
        wishes = WishListAnimal.where(animal_id: animal_id)
        wishes.each do |wish|
           alert = Alert.create(sighting_id: sighting_id, user_id: wish[:user_id])
        end
    end

    def update
        sighting = Sighting.find_by(id: params[:id])
        if sighting
            sighting.update(sighting_params)
            if sighting.valid?
                render json: sighting, status: 200
            else
                render json: {errors: sighting.errors.full_messages}, status: :unprocessable_entity
            end
        else
            render json: {error: 'Sighting not found.'}, status: :not_found
        end
    end

    def add_image
        sighting = Sighting.find_by(id: params[:id])
        sighting.update(image: params[:image])
        render json: sighting, status: :created
    end

    def destroy
        sighting = Sighting.find_by(id: params[:id])
        sighting.destroy
        head :no_content
    end

    def get_stats
        top_wishes = WishListAnimal.all.group(:animal_id).order('animal_id ASC').limit(3).count(:animal_id)
        wishes = []
        top_wishes.keys.each do |key|
            animal = Animal.find_by(id: key)
            wishes << animal
        end

        top_sightings = Sighting.all.group(:animal_id).order('animal_id ASC').limit(3).count(:animal_id)
        sightings = []
        top_sightings.keys.each do |key|
            animal = Animal.find_by(id: key)
            sightings << animal
        end
        render json: {wishes: wishes, sightings: sightings}
    end

    private

    def sighting_params
        params.permit(:animal_id, :outing_id, :environment, :weather_conditions, :notes)
    end

    def sighting_with_new_params
        params.permit(:outing_id, :environment, :weather_conditions, :notes, :common_name, :scientific_name, :description)
    end
end
