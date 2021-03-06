众筹筑屋是互联网时代一种新型的房地产形式。现有占地面积为102077.6平方米的众筹筑屋项目。项目推出后，有上万户购房者登记参筹。项目规定参筹者每户只能认购一套住房。

现有11个房型，房型的配置如下

## 房型配置

| 房型   | 住宅类型 | 容积率  | 开发成本  | 房型面积 | 开发成本 | 
| ---- | ---- | ---- | ----- | ---- | ---- | 
| 房型1  | 普通宅  | 列入   | 允许扣除  | 77   | 4263 | 
| 房型2  | 普通宅  | 列入   | 允许扣除  | 98   | 4323 | 
| 房型3  | 普通宅  | 列入   | 不允许扣除 | 117  | 4532 | 
| 房型4  | 非普通宅 | 列入   | 允许扣除  | 145  | 5288 | 
| 房型5  | 非普通宅 | 列入   | 允许扣除  | 156  | 5268 | 
| 房型6  | 非普通宅 | 列入   | 允许扣除  | 167  | 5533 | 
| 房型7  | 非普通宅 | 列入   | 允许扣除  | 178  | 5685 | 
| 房型8  | 非普通宅 | 列入   | 不允许扣除 | 126  | 4323 | 
| 房型9  | 其他   | 不列入  | 允许扣除  | 103  | 2663 | 
| 房型10 | 其他   | 不列入  | 允许扣除  | 129  | 2791 | 
| 房型11 | 非普通宅 | 不列入  | 不允许扣除 | 133  | 2982 | 

在建房规划设计中，需考虑诸多因素，如容积率、开发成本、税率、预期收益等。根据国家相关政策，不同房型的容积率、开发成本、开发费用等在核算上要求如下。

!!! note
	容积率（Plot Ratio/Floor Area Ratio/Volume Fraction）又称建筑面积毛密度，是指一个小区的地上总建筑面积与用地面积的比率。对于开发商来说，容积率决定地价成本在房屋中占的比例，而对于住户来说，容积率直接涉及到居住的舒适度。一个良好的居住小区，高层住宅容积率应不超过5，多层住宅应不超过3，绿地率应不低于30%。但由于受土地成本的限制，并不是所有项目都能做得到。

## 住宅核算指标

- 国家规定的最大容积率要求：	2.28
- 土地总面积（平方米）：	102077.6
- 取得土地支付的金额(元)：	777179627 
- 与转让房地产有关的税金：	按收入5.65%计算

 根据地形限制和申请规则，城建部门规定的11种房型最低套数约束和最高套数约束如下：

## 房型建设约束

|子项目|	最低套数	最高套数|
|-----|----|----|
|房型1|	50|	450|
|房型2|	50|	500|
|房型3|	50|	300|
|房型4|	150|	500|
|房型5|	100|	550|
|房型6|	150|	350|
|房型7|	50|	450|
|房型8|	100|	250|
|房型9|	50|	350|
|房型10|	50|	400|
|房型11|	50|	250|


在网上进行调查，得到网民对各种房型的满意比例如下：

## 满意比例

|		|	房型1	|	房型2	|	房型3	|	房型4	|	房型5	|	房型6	|
|-------|----------|-----------|------------|--------|-------|--------|
|	满意比例	|	0.4	|	0.6	|	0.5	|	0.6	|	0.7	|	0.8	|


|		|	房型7	|	房型8	|	房型9	|	房型10	|	房型11	|
|-------|----------|-----------|------------|--------|-------|
|	满意比例	|	0.9	|	0.6	|	0.2	|	0.3	|	0.4	|		

## 模型概述

为达到卖买双方双赢的目标，我们建立数学模型，提出四个方案用来分配：

- 该众筹筑屋项目的原方案（称为方案一），我们对该方案进行核算，得到一系列的基准值，方便与其他方案进行比较；
- 考虑参筹者对各房型的满意比例，建立**整数规划模型**，提出方案二，并对方案二进行核算。
- 一般而言，投资回报率达到25%以上的众筹项目才会被成功执行。通过对方案二进行核算，我们发现其投资回报率未达到25%，拟合**对数关系模型**调整房屋售价提出方案二，使得众筹筑屋方案得以成功执行。
- 为了达到尽可能实现参筹者及投资方双赢的目标，我们重新选取指标并运用**极差变换**和 **层次分析法**，对方案三进行调整提出方案四。
