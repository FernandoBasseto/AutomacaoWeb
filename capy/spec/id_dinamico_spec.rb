describe "IDs Dinamicos", :dinamico do
  before(:each) do
    visit "https://training-wheels-protocol.herokuapp.com/access"
  end

  it "cadastro" do
    #find("#PortalTheme_wt10_block_wtcontent_holder_wt8_wtUsernameInput").set "fernando"
    #find("#PasswordInput_wt11_PortalTheme_wt7_block_wtcontent_holder_wt8_wt").set "123456"
    #find("#PortalTheme_wt4_block_wtGetStartedButton_wtcontent_holder_OSCore_wt3_block").click

    ## Utilizando técnica de expressão Regular
    # $ => Termina com
    # ^ => Começa com
    # * => Contem
    find("input[id$=UsernameInput]").set "fernando"
    find("input[id^=PasswordInput]").set "123456"
    find("a[id*=GetStartedButton]").click

    expect(page).to have_content "Dados enviados. Aguarde aprovação do seu cadastro!"
    sleep 2
  end
end
