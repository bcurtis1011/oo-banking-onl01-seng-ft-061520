class Transfer
  
  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def valid?
    sender.valid? && receiver.valid?
  end
  
  def execute_transaction
    # transfer between 2 accounts with 1000 in it
    #user 2 is going to give user 1 $50 #-> true
    # user 2 will send $4000 to user 1 #-> false
    
    
    expect(transfer.status).to eq("complete")
  end
  
  
   describe '#execute_transaction' do
    let(:avi) { BankAccount.new("Avi") }
    let(:amanda) { BankAccount.new("Amanda") }
    let(:transfer) { Transfer.new(amanda, avi, 50) }
    let(:bad_transfer) { Transfer.new(amanda, avi, 4000) }

    it "can execute a successful transaction between two accounts" do
      transfer.execute_transaction
      expect(amanda.balance).to eq(950)
      expect(avi.balance).to eq(1050)
      
    end
end




