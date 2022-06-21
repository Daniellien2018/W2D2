require "employee"

class Startup
    def initialize(name, funding, salaries) #string, number, hash containing title --> salary
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end
    def name
        @name
    end
    def funding
        @funding
    end
    def salaries
        @salaries
    end
    def employees
        @employees
    end
    def valid_title?(title)
        salaries.keys.any? {|key| key == title}
        
        # salaries.each_key do |key| 
        #     if key == title
        #         return true
        #     end
        # end
        # return false
    end
    def >(startup)
        if self.funding > startup.funding
            return true
        else
            return false
        end
    end
    def hire(name, title)
        if self.valid_title?(title) 
            # Employee.new(name, title)
            @employees << Employee.new(name, title)
        else 
            raise "invalid title"
        end
    end
    def size
        @employees.length
    end
    def pay_employee(employee)
        money_owed= @salaries[employee.title]  
        if self.funding >= money_owed
            employee.pay(money_owed)
            @funding -= money_owed
        else
            raise "there is not enough funding"
        end
    end
    def payday
        employees.each {|employee| pay_employee(employee)}
    end

    def average_salary
        sum = 0 
        @employees.each do |employee|
            sum += @salaries[employee.title]
        end
        sum / @employees.length * 1.0
    end
    def close
        @employees = []
        @funding = 0 
    end
    def acquire(startup)
        @funding += startup.funding

        startup.salaries.each do |title, salary|
            if !@salaries.has_key?(title)
                @salaries[title] = salary
            end
        end

        @employees += startup.employees

        startup.close
    end
end
