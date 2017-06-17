caculate_single <- function(Suite, Price, Cost, Area, IsCommon, IsDeduction, LandValue)
{
  
  if (IsDeduction == "允许扣除")
    DevCost = Cost*Suite*Area
  else
    DevCost = 0
  
  AllDevCost = Cost*Suite*Area
  ValueofLand = LandValue*Area*Suite
  Income = Price*Suite*Area
  DevSpence = 0.1*(DevCost + ValueofLand)
  AllDevSpence = 0.1*(AllDevCost + ValueofLand)
  ElseSpence = 2*DevSpence
  TransferTax = 0.0565*Income
  Deduction = DevCost + ValueofLand + DevSpence + ElseSpence + TransferTax
  AddedValue = Income - Deduction 
  Rate = AddedValue/Deduction
  if (Rate <= 0.2)
  {
    if (IsCommon == "普通宅")
      AddedTax = 0
    else
      AddedTax=0.3*AddedValue
  }
  else if (Rate <= 0.5)
    AddedTax=0.3*AddedValue
  else if (Rate<=1)
    AddedTax=0.4*AddedValue-0.05*Deduction
  else if(Rate<=2)
    AddedTax=0.5*AddedValue-0.15*Deduction
  else
    AddedTax=0.6*AddedValue-0.35*Deduction
  if(AddedTax<0)
    AddedTax=0

  TotalCost=AllDevCost+ValueofLand+AllDevSpence+TransferTax
  TotalIncome = Income
  ROI=sum(TotalIncome-AddedTax-TotalCost)/sum(TotalCost)
  NetProfit = TotalIncome - AddedTax - TotalCost
  res = data.frame(Suite, ValueofLand, TransferTax,DevCost, AllDevCost, DevSpence, AllDevSpence, AddedValue, AddedTax,TotalCost, NetProfit, ROI)
  return(res)
}