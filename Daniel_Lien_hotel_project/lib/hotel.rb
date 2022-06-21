require_relative "room"

class Hotel
    def initialize(hotel_name, capacities_hash)
        @name = hotel_name
        @rooms = {}

        capacities_hash.each do |room, capacity|
            @rooms[room] = Room.new(capacity)
        end
    end
    def name
        return @name.split(" ").each {|part| part.capitalize!}.join(" ")
    end
    def rooms
        @rooms
    end
    def room_exists?(room_name)
        if @rooms.include?(room_name)
            return true
        end
        return false
    end
    def check_in(person, room_name)
        if self.room_exists?(room_name) 
            if @rooms[room_name].add_occupant(person)
                p "check in successful"
            else
                p "sorry, room is full"
            end
        else #if true
            p  "sorry, room does not exist"
        end
    end
    def has_vacancy?
        @rooms.values.any? { |room| room.available_space > 0}
        #any returns if at least one ele passes true 
    end

    def list_rooms
        @rooms.each do |room_name, room| #remember rooms is hash
            puts "#{room_name} : #{room.available_space}"
        end

    end
end
