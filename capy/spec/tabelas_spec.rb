describe "Tabelas", :tabs do
  before(:each) do
    visit "https://training-wheels-protocol.herokuapp.com/tables"
  end

  it "Deve exibir o salário do Stark" do
    atores = all("table tbody tr")
    stark = atores.detect { |ator| ator.text.include?("Robert Downey Jr") }
    #puts stark.text
    expect(stark.text).to include "10.000.000"
  end

  it "Deve exibir o salário do Vin Diesel" do
    diesel = find("table tbody tr", text: "@vindiesel")
    #puts diesel.text
    expect(diesel).to have_content "10.000.000"
  end

  it "Deve exibir o filme velozes" do
    diesel = find("table tbody tr", text: "@vindiesel")
    movie = diesel.all("td")[2].text
    expect(movie).to eql "Velozes e Furiosos"
  end

  it "Deve exibir o instagram do Chris Evans" do
    evans = find("table tbody tr", text: "Chris Evans")
    insta = evans.all("td")[4].text
    expect(insta).to eql "@teamcevans"
  end

  it "Deve selecionar Chris Prat para Remoção" do
    prat = find("table tbody tr", text: "Chris Prat")
    prat.find("a", text: "delete").click
    msg = page.driver.browser.switch_to.alert.text
    expect(msg).to eql "Chris Pratt foi selecionado para remoção!"
  end

  it "Deve selecionar Chris Prat para Edição" do
    pratt = find("table tbody tr", text: "Chris Prat")
    pratt.find("a", text: "edit").click
    msg = page.driver.browser.switch_to.alert.text
    expect(msg).to eql "Chris Pratt foi selecionado para edição!"
  end
end
