Boston Rental price predict:

Renting is very important in our life. Tenant has requriment for buget and area. Landlord wants to figure out hou much to ask. So I want to build a model to help peopel find theis best chioce
`https://www.rentals.com/` is  a very famous website people use to find the rental information. In this project, I only scraped the rental information in Boston area. Besides, there is a big relationship between the rental price and the town's economy. Around Boston area, there are 30 towns, so I also scrape the town's median income form `https://en.wikipedia.org/wiki/Boston#Twin_towns_and_sister_cities`. Another important feature for rental price is its location. If the location is near subway, school or finial center, the rental price which be higher compare to the market price. So I also calculate the distance between the location to subway, and location to some famous attractions (such as MIT, Boston University, South Station etc).

EDA_1:

![](https://raw.githubusercontent.com/danwang123/Boston_Rental/master/Image/Boston%20Rental%20Price%20Prediction.003.jpeg)
From this plot, we can find with the increse of square feet, the rent is increaing for both House and Apartment.There are some outliers (sqft less than 50 and larger than 6000). In the fllowing process, I delete the oulier from the dataset.

![](https://raw.githubusercontent.com/danwang123/Boston_Rental/master/Image/Boston%20Rental%20Price%20Prediction.004.jpeg)

Data Imputing:

![](https://raw.githubusercontent.com/danwang123/Boston_Rental/master/Image/Boston%20Rental%20Price%20Prediction.005.jpeg)
After checking the miss data, I find most of the missing value is caused randomly. Then I use KNN to imoute the missing value. 
![](https://raw.githubusercontent.com/danwang123/Boston_Rental/master/Image/Boston%20Rental%20Price%20Prediction.006.jpeg)
From the data imputation plot, we can find the imputated and origin data have the same distribution.

Feature Importance:

![](https://raw.githubusercontent.com/danwang123/Boston_Rental/master/Image/Boston%20Rental%20Price%20Prediction.007.jpeg)
Data Visualization
![](https://raw.githubusercontent.com/danwang123/Boston_Rental/master/Image/Boston%20Rental%20Price%20Prediction.008.jpeg)
![](https://raw.githubusercontent.com/danwang123/Boston_Rental/master/Image/Boston%20Rental%20Price%20Prediction.009.jpeg)
From these two plot, we can find the boosting methold works best in my dataset. Then by using shiny, I build a app to help people find their best choice.
![](https://raw.githubusercontent.com/danwang123/Boston_Rental/master/Image/Screen%20Shot%20.png)
