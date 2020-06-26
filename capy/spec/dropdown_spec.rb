describe "Caixa de opções", :dropdown do
  before(:each) do
    visit "https://training-wheels-protocol.herokuapp.com/dropdown"
  end

  it "Item especifico simples" do
    select("Loki", from: "dropdown") # Funciona somente para elementos que possuem ID na lista suspensa
  end
  it "Item especifico com o find" do
    drop = find(".avenger-list")
    drop.find("option", text: "Scott Lang").select_option #Selecionando item especifico
  end
  it "Qualquer item", :sample do
    drop = find(".avenger-list")
    drop.all("option").sample.select_option #Selecionando itens aleatórios automaticamente
  end
  after(:each) do
    sleep 3
  end
end
