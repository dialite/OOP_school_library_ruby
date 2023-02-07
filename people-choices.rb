require './student'
require './teacher'

class PeopleChoices
    attr_accessor :people

    def initialize
        @people = []
    end

    def list_all_people
        puts 'There are no people yet! Kindly add a student or teacher.' if @people.empty?
        @people.each_with_index do |person, index|
            puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
        end
        sleep 0.75
    end

    def create_person
        print 'Do you want to create a student (1) or teacher (2) [Input a number]: '
        option = gets.chomp
    
        case option
        when '1'
          create_student
        when '2'
          create_teacher
        else
          puts 'Invalid input. kindly type 1 or 2'
        end
    end

    def create_student
        print 'Age: '
        age = gets.chomp.to_i
    
        print 'Name: '
        name = gets.chomp
    
        print 'Has parent permission? [Y/N]: '
        parent_permission = gets.chomp.downcase
    
        student = Student.new(age, @class, name, parent_permission)
        @people.push(student)
    
        puts 'Student created successfully'
        sleep 0.75
    end

    def create_teacher
        print 'Age: '
        age = gets.chomp.to_i
    
        print 'Name: '
        name = gets.chomp
    
        print 'Specialization: '
        specialization = gets.chomp
    
        teacher = Teacher.new(age, specialization, name)
        @people << teacher
    
        puts 'Teacher created successfully'
        sleep 0.75
    end

end