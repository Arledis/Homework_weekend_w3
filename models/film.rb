require('PG')


class Film
  attr_reader :id
  attr_accessor :title, :price
def initialize(options)
  @id = options['id'].to_i if options['id']
  @title = options['title']
  @price = options['price'].to_i
end

def save()
  sql = "INSERT INTO films (title, price) VALUES ($1, $2) RETURNING id"
  values = [@title, @price]
  film = SqlRunner.run(sql, values).first
  @id = film['id'].to_i
end

def self.all()
  sql = "SELECT * FROM films;"
  films = SqlRunner.run(sql)
  return films.map { |film| Film.new(film)  }
end

def self.delete_all()
  sql = "DELETE * FROM films;"
  SqlRunner.run(sql)
end

def customers()
  sql = "SELECT customers.* FROM customers
  INNER JOIN tickets
  ON tickets.customer_id = customers.id
  WHERE film_id = $1"
  values = [@id]
  customers = SqlRunner.run(sql, values)
  results = customers.map { |customer| Customer.new(customer)  }
  return results
end

def self.find(id) # EXTENSION
  sql = "SELECT * FROM films WHERE id = $1"
  values = [id]
  result = SqlRunner.run(sql, values)
  films = self.new(result.first)
  return films
end
