class Room
    def initialize(capacity_num)
        @capacity = capacity_num
        @occupants = []
    end
    def capacity
        @capacity
    end
    def occupants
        @occupants
    end
    def full?
        if @occupants.length < @capacity
            return false
        end
        return true
    end
    def available_space
        availability = @capacity - @occupants.length
        return availability
    end
    def add_occupant(name)
        if self.full? == false
            @occupants << name
            return true
        else
            return false
        end
    end
end