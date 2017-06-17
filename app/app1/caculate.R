caculate <- function(scheme)
{
  if (scheme == "方案一")
  {
    Suite = c(250, 250, 150, 250, 250, 250, 250, 75, 150, 150, 75) 
    Price = c(12000, 10800, 11200, 12800, 12800, 13600, 14000, 10400, 6400,	6800, 7200)
  }
  else if (scheme == "方案二")
  {
    Suite = c(50, 50, 50, 150, 100, 350, 450, 100, 50, 50, 50) 
    Price = c(12000, 10800, 11200, 12800, 12800, 13600, 14000, 10400, 6400,	6800, 7200)
  }
  else if (scheme == "方案三")
  {
    Suite = c(50, 50, 50, 150, 291, 349, 450, 100, 50, 50, 50) 
    Price = c(12375, 10998, 11646, 12800, 12800, 13600, 14000, 10400, 6400,	6800, 7200)
  }
  else
  {
    Suite = c(50, 50, 50, 150, 291, 349, 450, 100, 50, 50, 50) 
    Price = c(11633, 10998, 11086, 12800, 12800, 13600, 14000, 10400, 6400,	6800, 7200)
  }
Cost = c(4263, 4323, 4532, 5288, 5268, 5533, 5685, 4323, 2663, 2791, 2982)
Area0 = c(77, 98, 117, 145, 156, 167, 178, 126, 103, 129, 133)
AreaofCommon = c(77, 98, 117)
AreaofIncommon = c(145, 156, 167, 178, 126, 133)
SuiteofCommon = Suite[c(1, 2, 3)]
SuiteofIncommon = Suite[c(4, 5, 6, 7, 8, 11)]
k = sum(AreaofCommon*SuiteofCommon)/(sum(AreaofIncommon*SuiteofIncommon)+sum(AreaofCommon*SuiteofCommon))
LandValue = 777179627
TotalArea = sum(Area0*Suite)
## Common Part(including else)
AllDevCost1=rep(0, 11)
DevCost1=rep(0, 11)
Income1=rep(0, 11)
ValueofLand1=rep(0, 11)
AllDevSpence1=rep(0, 11)
DevSpence1=rep(0, 11)
ElseSpence1=rep(0, 11)
TransferTax1=rep(0, 11)
Deduction1=rep(0, 11)
AddedValue1=rep(0, 11)
CommonRate=rep(0, 11)
CommonAddedTax=rep(0, 11)
Area1 = Area0
Area1[c(9, 10)] = k*Area0[c(9, 10)]
DevCost1[c(1, 2, 9, 10)] = Cost[c(1, 2, 9, 10)]*Suite[c(1, 2, 9, 10)]*Area1[c(1, 2, 9, 10)]
AllDevCost1[c(1, 2, 3, 9, 10)] = Cost[c(1, 2, 3, 9, 10)]*Suite[c(1, 2, 3, 9, 10)]*Area1[c(1, 2, 3, 9, 10)]
ValueofLand1[c(1, 2, 3, 9, 10)] = LandValue*Area1[c(1, 2, 3, 9, 10)]*Suite[c(1, 2, 3, 9, 10)]/TotalArea
Income1[c(1, 2, 3, 9, 10)] = Price[c(1, 2, 3, 9, 10)]*Suite[c(1, 2, 3, 9, 10)]*Area1[c(1, 2, 3, 9, 10)]
DevSpence1[c(1, 2, 3, 9, 10)] = 0.1*(DevCost1[c(1, 2, 3, 9, 10)] + ValueofLand1[c(1, 2, 3, 9, 10)])
AllDevSpence1[c(1, 2, 3, 9, 10)] = 0.1*(AllDevCost1[c(1, 2, 3, 9, 10)]+ValueofLand1[c(1, 2, 3, 9, 10)])
ElseSpence1=2*DevSpence1
TransferTax1=0.0565*Income1
Deduction1=DevCost1+ValueofLand1+DevSpence1+ElseSpence1+TransferTax1
AddedValue1=Income1-Deduction1
CommonRate[c(1, 2, 3, 9, 10)]=AddedValue1[c(1, 2, 3, 9, 10)]/Deduction1[c(1, 2, 3, 9, 10)]
for (i in c(1, 2, 3, 9, 10))
{
  if (CommonRate[i] <= 0.2)
    CommonAddedTax[i] = 0
  else if (CommonRate[i] <= 0.5)
    CommonAddedTax[i]=0.3*AddedValue1[i]
  else if (CommonRate[i]<=1)
    CommonAddedTax[i]=0.4*AddedValue1[i]-0.05*Deduction1[i]
  else if(CommonRate[i]<=2)
    CommonAddedTax[i]=0.5*AddedValue1[i]-0.15*Deduction1[i]
  else
    CommonAddedTax[i]=0.6*AddedValue1[i]-0.35*Deduction1[i]
  if(CommonAddedTax[i]<0)
    CommonAddedTax[i]=0
}

## Incommon Part(including else)
DevCost2=rep(0, 11)
AllDevCost2= rep(0, 11)
Income2= rep(0, 11)
ValueofLand2= rep(0, 11)
DevSpence2= rep(0, 11)
AllDevSpence2= rep(0, 11)
ElseSpence2= rep(0, 11)
TransferTax2= rep(0, 11)
Deduction2= rep(0, 11)
AddedValue2= rep(0, 11)
IncommonRate= rep(0, 11)
IncommonAddedTax= rep(0, 11)
Area2 = Area0
Area2[c(9, 10)]=(1-k)*Area0[c(9, 10)]
DevCost2[c(4,5,6,7,9,10)]=Cost[c(4,5,6,7,9,10)]*Suite[c(4,5,6,7,9,10)]*Area2[c(4,5,6,7,9,10)]
AllDevCost2[c(4:11)]=Cost[c(4:11)]*Suite[c(4:11)]*Area2[c(4:11)]
ValueofLand2[c(4:11)]=LandValue*Area2[c(4:11)]*Suite[c(4:11)]/TotalArea
Income2[c(4:11)]=Price[c(4:11)]*Suite[c(4:11)]*Area2[c(4:11)]
DevSpence2[c(4:11)]=0.1*(DevCost2[c(4:11)]+ValueofLand2[c(4:11)])
AllDevSpence2[c(4:11)]=0.1*(AllDevCost2[c(4:11)]+ValueofLand2[c(4:11)])
ElseSpence2=2*DevSpence2
TransferTax2=0.0565*Income2
Deduction2=DevCost2+ValueofLand2+DevSpence2+ElseSpence2+TransferTax2
AddedValue2=Income2-Deduction2
IncommonRate[c(4:11)]=AddedValue2[c(4:11)]/Deduction2[c(4:11)]
for (i in c(4:11))
{
  if(IncommonRate[i]<=0.5)
    IncommonAddedTax[i]=0.3*AddedValue2[i]
  else if(IncommonRate[i]<=1)
    IncommonAddedTax[i]=0.4*AddedValue2[i]-0.05*Deduction2[i]
  else if(IncommonRate[i]<=2)
    IncommonAddedTax[i]=0.5*AddedValue2[i]-0.15*Deduction2[i]
  else
    IncommonAddedTax[i]=0.6*AddedValue2[i]-0.35*Deduction2[i]
  if(IncommonAddedTax[i]<0)
    IncommonAddedTax[i]=0
}
TotalIncome = Income1+Income2
ValueofLand = ValueofLand1+ValueofLand2
DevCost=DevCost1+DevCost2
AllDevCost=AllDevCost1+AllDevCost2
DevSpence=DevSpence1+DevSpence2
AllDevSpence=AllDevSpence1+AllDevSpence2
TransferTax=TransferTax1+TransferTax2
Deduction=Deduction1+Deduction2
AddedValue=AddedValue1+AddedValue2
AddedTax=CommonAddedTax+IncommonAddedTax
Rate=CommonRate+IncommonRate
TotalCost=AllDevCost2+ValueofLand2+AllDevSpence2+AllDevCost1+ValueofLand1+AllDevSpence1
ROI=sum(TotalIncome-AddedTax-TotalCost-TransferTax)/sum(TotalCost)
NetProfit = TotalIncome-AddedTax-TotalCost
# df = data.frame(TotalIncome,
#                 ValueofLand,
#                 DevCost,
#                 AllDevCost,
#                 DevSpence,
#                 AllDevSpence,
#                 TransferTax,
#                 Deduction,
#                 AddedValue,
#                 Rate,
#                 AddedTax,
#                 TotalCost,
#                 NetProfit)
df = data.frame(Suite,
                Price,
                TotalCost,
                NetProfit)
rownames(df) = paste0("房型",1:11)
return(list(df = df, ROI = ROI))
#fprintf('ROI =\n\t%d',ROI) 
}