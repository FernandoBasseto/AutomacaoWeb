Estória: Saque no Caixa Eletrônico
    Sendo um cliente que é correntista do Ninja Bank
    Posso sacar dinheiro
    Para que eu consiga comprar em lugares que não aceitam débito ou crédito.

#Existem 3 pontos chaves que são fundamentais nas estórias de usuário, são eles:
#Para Quem? Para quem estamos desenvolvendo a funcionalidade.
#O que? Uma descrição resumida da funcionalidade em si.
#Por quê? O motivo pelo qual o cliente precisa desta funcionalidade. Se possível citando o ganho de negócio.

Cenário: Saque em conta corrente
    Dado que eu tenho R$ 1000 em minha conta corrente
    Quando faço um saque de R$ 200
    Então meu saldo final deve ser R$ 800

Cenário: Deu ruim não tenho saldo
    Dado que eu tenho R$ 0 em minha conta corrente
    Quando faço um saque de R$ 100
    Então vejo a mensagem "Saldo insuficiente para saque :("
    E meu saldo final deve ser R$ 0

Cenário: Tenho saldo mas não o suficiente
    Dado que eu tenho R$ 500 em minha conta corrente
    Quando faço um saque de R$ 501
    Então vejo a mensagem "Saldo insuficiente para saque :("
    E meu saldo final deve ser R$ 500

Cenário: Limite por saque :(
    Dado que eu tenho R$ 1000 em minha conta corrente
    Quando faço um saque de R$ 701
    Então vejo a mensagem "Limite máximo por saque é de R$ 700"
    E meu saldo final deve ser R$ 1000
