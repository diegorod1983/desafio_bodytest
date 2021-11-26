import psycopg2
from logging import info

class DeloreanLibrary():

  def connect(self):
    # abre a conexao com o banco postgree
    return psycopg2.connect(
      host='ec2-44-199-83-229.compute-1.amazonaws.com',
      database='d4l0tqb9jjaai7',
      user='cvvmblhhadkkxc',
      password='470045eeb78ca595f4f7bfb0854da535bab2748e48b5b496cdab902fb48b4edc'
    )


  # É uma funcão em python mas no robot vira uma KeyWord automaticamente
  def remove_student(self, email):

    query = "delete from students where email = '{}'".format(email)
    info(query)

    # abre a conexao com o banco postgree
    conn= self.connect()
    info(conn)

    # cria um cursor para utilizar a query
    cur = conn.cursor()
    info(cur)
    # executa a query
    cur.execute(query)
    # aplica o resultado da query no banco
    conn.commit()
    
    # fecha o banco
    conn.close()

    info(conn)

  def remove_student_by_name(self, name):
    query = "delete from students where name LIKE '%{}%'".format(name)
    info(query)

    conn= self.connect()
    cur = conn.cursor()
    cur.execute(query)
    conn.commit()
    conn.close()

  def insert_student(self, student):

    self.remove_student(student['email'])

    query = ("insert into students (name, email, age, weight, feet_tall, created_at, updated_at)"
            "values ('{}', '{}', {}, {}, {}, NOW(), NOW());"
            .format(student['name'], student['email'], student['age'], student['weight'], student['feet_tall'])
            )

    info(query)

    conn= self.connect()
    cur = conn.cursor()
    cur.execute(query)
    conn.commit()
    conn.close()

  def remove_plan(self, title):

    query = "delete from plans where title = '{}'".format(title)
    
    info(query)

    conn= self.connect()
    cur = conn.cursor()
    cur.execute(query)
    conn.commit()
    conn.close()

  def remove_plan_by_title(self, title):

    query = "delete from plans where title LIKE '%{}%'".format(title)
    
    info(query)

    conn= self.connect()
    cur = conn.cursor()
    cur.execute(query)
    conn.commit()
    conn.close()

  def insert_plan(self, plan):

    self.remove_plan_by_title(plan['title'])

    query = ("insert into plans (title, duration, price, created_at, updated_at)"
            "values ('{}', {}, {}, NOW(), NOW());"
            .format(plan['title'], plan['duration'], plan['price'])
            )
    info(query)

    conn= self.connect()
    cur = conn.cursor()
    cur.execute(query)
    conn.commit()
    conn.close()