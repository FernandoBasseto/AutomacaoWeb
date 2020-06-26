
describe "login2", :login2 do
  before(:each) do
    visit "https://training-wheels-protocol.herokuapp.com/login2"
  end

  it "Com data de nascimento" do
    #fill_in "username", with: "stark"
    find("#userId").set "stark"
    find("#passId").set "jarvis!"

    login_form = find("#login")

    case login_form.text
    when /Dia/
      find("#day").set "29"
    when /Mês/
      find("#month").set "05"
    when /Ano/
      find("#year").set "1970"
    end

    click_button "Login"
    expect(find("#flash").visible?).to be true
  end
end
