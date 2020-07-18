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
    if valid? && receiver.balance > amount && self.status == "complete"
      receiver.balance -= amount
      sender.balance += amount
      self.status = "complete"
    else
      reject_tranfer
    end
  end

end




