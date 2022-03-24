
def factory_partner_enable():
    partner = {
        'name': 'Dogão do Marcio',
        'email': 'contatoDog@io.com.br',
        'whatsapp': '62345123678',
        'business': 'Restaurante'
    }
    return partner


def factory_partner_delete():
    partner = {
        'name': 'Fátima Verduras',
        'email': 'fatima123@io.com.br',
        'whatsapp': '62345123678',
        'business': 'Conveniência'
    }
    return partner

def factory_partner_404():
    partner = {
        'name': 'Dogão do Marcio',
        'email': 'contatoDog@io.com.br',
        'whatsapp': '62345123678',
        'business': 'Restaurante'
    }
    return partner


def factory_new_partner():
    partner = {
        'name': 'Salgados Neymar',
        'email': 'neygados@io.com.br',
        'whatsapp': '11999999999',
        'business': 'Restaurante'
    }
    return partner


def factory_duplicate_partner():
    partner = {
        'name': 'Pastel Gabiru',
        'email': 'contato_gabiru@os.com.br',
        'whatsapp': '21999999999',
        'business': 'Restaurante'
    }
    return partner

def factory_list_partners():
    list_partners = [
         {
        'name': 'Lazaro Conveniencia',
        'email': 'contatoLL@ig.com.br',
        'whatsapp': '21999999999',
        'business': 'Conveniência'
        }, 
        {
        'name': 'Burger Beachs And Cofee ',
        'email': 'beach_burger@io.com',
        'whatsapp': '11284736478',
        'business': 'Restaurante'
        },
        {
        'name': 'Pizzaria Lula Livre',
        'email': 'lulaodamassa@io.com',
        'whatsapp': '21100023678',
        'business': 'Restaurante'
        }
    ]
    return  list_partners