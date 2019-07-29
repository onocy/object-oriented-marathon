class Zoo
  attr_reader :cages, :employees

  def initialize(name, opening_date, closing_date)
    @cages = Array.new(10) {Cage.new}
    @employees = []
    @opening_date = opening_date
    @closing_date = closing_date
    # @cages = []
    # 10.times do
    #   @cages << Cage.new
    # end
  end

  def add_employee(employee)
    @employees.push(employee)
  end

  def open?(date)
    date >= @opening_date && date <= @closing_date
  end

  def add_animal(animal)

    @cages.each do |cage|
      if cage.empty?
        return cage.animal = animal
      end
    end

    return "Your zoo is already at capacity!"
  end

  def visit
    employee_greetings = @employees.map {|employee| employee.greet}.join("\n")
    animal_greetings = @cages.keep_if {|cage| !cage.empty?} \
      .map {|cage| cage.animal.speak}.join("\n")
    return "#{employee_greetings}\n#{animal_greetings}\n"
  end
end
