require_relative('../db/sql_runner')


class Customer
  attr_reader :id
  attr_accessor :name, :cash

def initialize(options)
  @id = options['id'].to_i if options['id']
  @name = options['name']
  @cash = options['cash'].to_i
end

# CREATE
def save()
  sql = "INSERT INTO customers (name, cash) VALUES ($1, $2) RETURNING id"
  values = [@name, @cash]
  customer = SqlRunner.run( sql, values ).first
  @id = customer['id'].to_i
end

# UPDATE
def update()
  sql = "UPDATE customers SET name = $1 WHERE id = $2"
  values = [@name, @id]
  SqlRunner.run( sql, values )
end

# DELETE
def self.delete_all()
  sql = "DELETE FROM customers"
  SqlRunner.run(sql)
end

# READ
def self.all()
  sql = "SELECT * FROM customers ORDER BY name;"
  customers = SqlRunner.run(sql)
  customers = customers.map { |customer| Customer.new(customer)  }
  return customers #sort! #not 100% sure
end

def films()
  sql = "SELECT films.* FROM films
  INNER JOIN tickets
  ON tickets.film_id = films.id
  WHERE customer_id = $1"
  values = [@id]
  films = SqlRunner.run(sql, values)
  results = films.map { |film| Film.new(film)  }
  return results
end

def self.find(id) # EXTENSION
    sql = "SELECT * FROM customers WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    customer = self.new(result.first)
    return customer
  end


end
