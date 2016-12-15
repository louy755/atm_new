class TransactionsList < Prawn::Document
  
  def initialize(transactions)
    super()
    @transactions = transactions
    
   

  #header 
      data = [[{:content => " Transactions Summary",:colspan => 5,:size => 18, :text_color => "000000", :align => :center,:font_style => :bold }]] 
      data += [["Tran no","AMOUNT","Tran Type","ATM Location","Date"]]
  
  # body
      @transactions.recent.each do |i|
        data += [[("#{i.id}"),( "$ #{i.amount}"),( "#{( ("Debit" if i.debit == true) || ("Withdrawal" if i.debit == false))}" ),( "#{i.atm_mach.address}"),( "#{i.created_at.strftime("%I:%M:%S %p --- %m/%d/%Y")}")]]
      end

      table(
        data,
        :row_colors => ["ddeaff","ffffff"],
        :position => :center, 
        :header => true,
        :column_widths => [50,75,75,150,150]
        )
    
  # the page number in footer 
      number_pages "(<page> of <total>)",{
        :start_count_at => 0,
        :page_filter => :all,
        :at => [bounds.right - 550,0],
        :align => :center, 
        :size => 13 }
  end    
end