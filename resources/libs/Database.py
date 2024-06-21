import psycopg2

db_conn = f"""
    host='localhost'
    dbname='postgres'
    user='postgres'
    password='admin321$'
"""

def execute_query(query):
    conn = psycopg2.connect(db_conn)
    cur = conn.cursor()
    cur.execute(query)
    conn.commit()
    conn.close()

# usado para inserir uma conta
def insert_account(account):
    query = f"""
        insert into accounts(email, name, cpf)
        values('{account["email"]}', '{account["name"]}','{account["cpf"]}');
        """
    execute_query(query)


# usar para deletar uma conta
def delete_account_by_email(email):
    query = f"DELETE FROM accounts WHERE email = '{email}';"
    execute_query(query)

