from faker import Faker

fake = Faker('pt_BR')

# massa de teste
def get_fake_account():
    account = {
        "name": fake.name(),
        "email": fake.email(),
        "cpf": fake.cpf()
    }
    return account

# usar o faker para dados que não são chave, para não inflar o banco de dados



