require_relative "../../app/bank"

describe ContaCorrente do
  describe "Saque" do
    context "Quando o valor é positivo" do
      before(:all) do
        @cc = ContaCorrente.new(1000.00)
        @cc.saca(200.00)
      end
      it "Então atualiza saldo" do
        expect(@cc.saldo).to eql 800.00
      end
    end
    context "Quando o saldo é zero" do
      before(:all) do
        @cc = ContaCorrente.new(0.00)
        @cc.saca(100.00)
      end
      it "Então exibe a mensagem" do
        expect(@cc.mensagem).to eql "Saldo insuficiente para saque :("
      end
      it "Saldo zero" do
        expect(@cc.saldo).to eql 0.00
      end
    end
    context "Quando o saldo é insuficiente" do
      before(:all) do
        @cc = ContaCorrente.new(500.00)
        @cc.saca(501.00)
      end
      it "Então exibe mensagem" do
        expect(@cc.mensagem).to eql "Saldo insuficiente para saque :("
      end
      it "Saldo Insuficiente" do
        expect(@cc.saldo).to eql 500.00
      end
    end
    context "Quando supera o limite de saque" do
      before(:all) do
        @cc = ContaCorrente.new(1000.00)
        @cc.saca(701.00)
      end
      it "Então exibe mensagem" do
        expect(@cc.mensagem).to eql "Limite máximo por saque é de R$ 700"
      end
      it "e o saldo permanece" do
        expect(@cc.saldo).to eql 1000.00
      end
    end
  end
end
