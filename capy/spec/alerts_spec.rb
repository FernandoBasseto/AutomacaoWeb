describe "Alertas de JS", :alerts do
  before(:each) do
    visit "https://training-wheels-protocol.herokuapp.com/javascript_alerts"
  end

  it "Alerta" do #Método Alert
    click_button "Alerta"

    msg = page.driver.browser.switch_to.alert.text
    expect(msg).to eql "Isto é uma mensagem de alerta"
    sleep 5
  end

  it "Sim confirma" do #Método Confirm
    click_button "Confirma"

    msg = page.driver.browser.switch_to.alert.text
    expect(msg).to eql "E ai confirma?"
    sleep 2

    page.driver.browser.switch_to.alert.accept
    expect(page).to have_content "Mensagem confirmada"
    sleep 3
  end

  it "Não confirma" do #Método Confirm
    click_button "Confirma"

    msg = page.driver.browser.switch_to.alert.text
    expect(msg).to eql "E ai confirma?"
    sleep 2

    page.driver.browser.switch_to.alert.dismiss
    expect(page).to have_content "Mensagem não confirmada"
    sleep 3
  end

  it "accept prompt" do #Método Prompt
    accept_prompt(with: "Fernando") do
      click_button "Prompt"
      sleep 2
    end
    expect(page).to have_content "Olá, Fernando"
    sleep 3
  end
end
