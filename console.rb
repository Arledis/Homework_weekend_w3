require_relative('./models/customer')
require_relative('./models/ticket')
require_relative('./models/film')


require( 'pry' )
Customer.delete_all()
Film.delete_all()
Ticket.delete_all()

customer1 = Customer.new({'name' => 'Bob', 'cash' => '200'})
customer1.save()
customer2 = Customer.new({'name' => 'Duncan', 'cash' => '120'})
customer2.save()
customer3 = Customer.new({'name' => 'Allison', 'cash' => '20'})
customer3.save()
customer4 = Customer.new({'name' => 'Allison', 'cash' => '20'})
customer4.save()


all_customers = Customer.all()

film1 = Film.new({'title' => 'Alladin', 'price' => '10'})
film1.save()
film2 = Film.new({'title' => 'Godzilla: King of the Monsters', 'price' => '12'})
film2.save()
film3 = Film.new({'title' => 'POKEMON Detective Pikachu', 'price' => '9'})
film3.save()
film4 = Film.new({'title' => 'X-Men: Dark Phoenix', 'price' => '13'})
film4.save()

all_films = Film.all()

ticket1 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film1.id})
ticket1.save()
ticket2 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film2.id})
ticket2.save()
ticket3 = Ticket.new({'customer_id' => customer3.id, 'film_id' => film3.id})
ticket3.save()
ticket4 = Ticket.new({'customer_id' => customer4.id, 'film_id' => film4.id})
ticket4.save()

all_tickets = Ticket.all()

# returned_customer= Customer.find(1)

binding.pry
nil
