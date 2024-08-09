/*create table Regions(
	RegionCODE NVARCHAR(100) PRIMARY KEY,
    RegionName NVARCHAR(100) NOT NULL
); 

create table SubRegions(
	SubregionCODE NVARCHAR(100) PRIMARY KEY,
	RegionCode NVARCHAR(100) FOREIGN KEY REFERENCES Regions(RegionCODE),
    SubregionName NVARCHAR(100) NOT NULL
);

CREATE TABLE Countries (
    CountryCODE NVARCHAR(100) PRIMARY KEY,
	SubregionCode NVARCHAR(100) FOREIGN KEY REFERENCES SubRegions(SubregionCODE),
    CountryName NVARCHAR(100) NOT NULL
);

CREATE TABLE Dimensions (
    DimensionID INT PRIMARY KEY IDENTITY(1,1),
    DimensionName NVARCHAR(255) NOT NULL
);

CREATE TABLE Indicators (
    IndicatorID INT PRIMARY KEY IDENTITY(1,1),
    IndicatorName NVARCHAR(255) NOT NULL,
	DimensionID INT FOREIGN KEY REFERENCES Dimensions(DimensionID)
);

CREATE TABLE Data (
    DataID INT PRIMARY KEY IDENTITY(1,1),
    CountryCODE NVARCHAR(100) FOREIGN KEY REFERENCES Countries(CountryCODE),
    IndicatorID INT FOREIGN KEY REFERENCES Indicators(IndicatorID),
    Year INT NOT NULL,
    Value DECIMAL(18, 2) NOT NULL
); 
*/


/*INSERT INTO Countries (CountryCODE, SubregionCode, CountryName)
VALUES 
('AFG', 'SAS', 'Afghanistan'),
('DZA', 'NA', 'Algeria'),
('ALB', 'EU', 'Albania'),
('AZE', 'ME','Azerbaijan'),
('BHR', 'ME','Bahrain'),
('BGD', 'SAS','Bangladesh'),
('BRN', 'SEAS','Brunei Darussalam'),
('BFA', 'WA', 'Burkina Faso'),
('BEN', 'WA', 'Benin'),
('CMR', 'CA','Cameroon'),
('TCD', 'CA','Chad'),
('COM', 'EA','Comoros'),
('CIV', 'WA','Cote d''Ivoire'),
('DJI', 'EA','Djibouti'),
('EGY', 'NA','Egypt'),
('GAB', 'CA','Gabon'),
('GMB', 'WA','Gambia'),
('GIN', 'WA','Guinea'),
('GUY', 'SA','Guyana'),
('GNB', 'WA','Guinea-Bissau'),
('IRQ', 'ME','Iraq'),
('IDN', 'SEAS','Indonesia'),
('IRN', 'ME','Iran'),
('JOR', 'ME','Jordan'),
('KAZ', 'CAS','Kazakhstan'),
('KWT', 'ME','Kuwait'),
('KGZ', 'CAS','Kyrgyzstan'),
('LBN', 'ME','Lebanon'),
('LBY', 'NA','Libya'),
('MYS', 'SEAS','Malaysia'),
('MDV', 'SAS','Maldives'),
('MLI', 'WA','Mali'),
('MRT', 'NA','Mauritania'),
('MAR', 'NA','Morocco'),
('MOZ', 'EA','Mozambique'),
('NER', 'WA','Niger'),
('NGA', 'WA','Nigeria'),
('OMN', 'ME','Oman'),
('PAK', 'SAS','Pakistan'),
('QAT', 'ME','Qatar'),
('SAU', 'ME','Saudi Arabia'),
('SEN', 'WA','Senegal'),
('SLE', 'WA','Sierra Leone'),
('SOM', 'EA','Somalia'),
('SUR', 'SA','Suriname'),
('SDN', 'NA','Sudan'),
('SYR', 'ME','Syrian Arab Republic'),
('TJK', 'CAS','Tajikistan'),
('TGO','WA','Togo'),
('TUN', 'NA','Tunisia'),
('TUR', 'EU','Turkiye'),
('TKM', 'CAS','Turkmenistan'),
('UGA', 'EA','Uganda'),
('UAE', 'ME','United Arab Emirates'),
('UZB', 'CAS','Uzbekistan'),
('YEM', 'ME','Yemen');*/

--select * from Countries;

/*INSERT INTO Indicators (IndicatorName)
VALUES 
('GDP growth (annual %)'),
('Income share held by lowest 20%'),
('Income share held by lowest 10%'),
('Income share held by highest 10%'),
('Income share held by highest 20%'),
('GDP (current US$)'),
('GDP per capita, PPP (current international $)'),
('GDP per capita (current US$)'),
('CPIA gender equality rating (1=low to 6=high)'),
('Access to electricity (% of population)');*/

 /*
select * from Countries;
select * from Indicators;
select * from Dimensions;
Select * from Data;
select * from Indicators;
select * from Regions;
select * from SubRegions;
*/
/*

INSERT INTO Regions(RegionCODE, RegionName)
VALUES 
('AFR', 'Africa'),
('AS', 'Asia'),
('EU', 'Europe'),
('SA', 'South America');*/

/*
INSERT INTO SubRegions(SubregionCODE, RegionCode, SubregionName)
Values
('SAS', 'AS', 'South Asia'),
('CAS', 'AS', 'Central Asia'),
('ME', 'AS', 'Middle East'),
('SEAS', 'AS', 'Southeast Asia'),
('NA', 'AFR', 'North Africa'),
('WA', 'AFR', 'West Africa'),
('CA', 'AFR', 'Central Africa'),
('EA', 'AFR', 'East Africa'),
('EU', 'EU', 'Europe'),
('SA', 'SA', 'South America');


///many to many:
INSERT INTO SubRegionRegions(RegionCODE, SubregionCode)
Values
('AS', 'SAS'),
('AS', 'CAS'),
('AS', 'ME'),
('AS', 'SEAS'),
('AFR','NA'),
('AFR','WA'),
('AFR','CA'),
('AFR','EA'),
('EU', 'EU'),
('SA', 'SA'),
('AS', 'AR'),
('AFR', 'AR');


INSERT INTO Countries (CountryCODE, CountryName)
VALUES 
('AFG', 'Afghanistan'),
('DZA', 'Algeria'),
('ALB', 'Albania'),
('AZE', 'Azerbaijan'),
('BHR', 'Bahrain'),
('BGD', 'Bangladesh'),
('BRN', 'Brunei Darussalam'),
('BFA', 'Burkina Faso'),
('BEN', 'Benin'),
('CMR', 'Cameroon'),
('TCD', 'Chad'),
('COM', 'Comoros'),
('CIV', 'Cote d''Ivoire'),
('DJI', 'Djibouti'),
('EGY', 'Egypt'),
('GAB', 'Gabon'),
('GMB', 'Gambia'),
('GIN', 'Guinea'),
('GUY', 'Guyana'),
('GNB', 'Guinea-Bissau'),
('IRQ', 'Iraq'),
('IDN', 'Indonesia'),
('IRN', 'Iran'),
('JOR', 'Jordan'),
('KAZ', 'Kazakhstan'),
('KWT', 'Kuwait'),
('KGZ', 'Kyrgyzstan'),
('LBN', 'Lebanon'),
('LBY', 'Libya'),
('MYS', 'Malaysia'),
('MDV', 'Maldives'),
('MLI', 'Mali'),
('MRT', 'Mauritania'),
('MAR', 'Morocco'),
('MOZ', 'Mozambique'),
('NER', 'Niger'),
('NGA', 'Nigeria'),
('OMN', 'Oman'),
('PAK', 'Pakistan'),
('QAT', 'Qatar'),
('SAU', 'Saudi Arabia'),
('SEN', 'Senegal'),
('SLE', 'Sierra Leone'),
('SOM', 'Somalia'),
('SUR', 'Suriname'),
('SDN', 'Sudan'),
('SYR', 'Syrian Arab Republic'),
('TJK', 'Tajikistan'),
('TGO', 'Togo'),
('TUN', 'Tunisia'),
('TUR', 'Turkiye'),
('TKM', 'Turkmenistan'),
('UGA', 'Uganda'),
('UAE', 'United Arab Emirates'),
('UZB', 'Uzbekistan'),
('YEM', 'Yemen');

Insert into CountrySubRegions (CountryCode, SubRegionCode)
Values
('AFG', 'SAS'),
('DZA', 'NA'),
('ALB', 'EU'),
('AZE', 'ME'),
('BHR', 'ME'),
('BGD', 'SAS'),
('BRN', 'SEAS'),
('BFA', 'WA'),
('BEN', 'WA'),
('CMR', 'CA'),
('TCD', 'CA'),
('COM', 'EA'),
('CIV', 'WA'),
('DJI', 'EA'),
('EGY', 'NA'),
('GAB', 'CA'),
('GMB', 'WA'),
('GIN', 'WA'),
('GUY', 'SA'),
('GNB', 'WA'),
('IRQ', 'ME'),
('IDN', 'SEAS'),
('IRN', 'ME'),
('JOR', 'ME'),
('KAZ', 'CAS'),
('KWT', 'ME'),
('KGZ', 'CAS'),
('LBN', 'ME'),
('LBY', 'NA'),
('MYS', 'SEAS'),
('MDV', 'SAS'),
('MLI', 'WA'),
('MRT', 'NA'),
('MAR', 'NA'),
('MOZ', 'EA'),
('NER', 'WA'),
('NGA', 'WA'),
('OMN', 'ME'),
('PAK', 'SAS'),
('QAT', 'ME'),
('SAU', 'ME'),
('SEN', 'WA'),
('SLE', 'WA'),
('SOM', 'EA'),
('SUR', 'SA'),
('SDN', 'NA'),
('SYR', 'ME'),
('TJK', 'CAS'),
('TGO','WA'),
('TUN', 'NA'),
('TUR', 'EU'),
('TKM', 'CAS'),
('UGA', 'EA'),
('UAE', 'ME'),
('UZB', 'CAS'),
('YEM', 'ME'),
('DZA', 'AR'),
('EGY', 'AR'),
('LBY', 'AR'),
('MAR', 'AR'),
('SDN', 'AR'),
('TUN', 'AR'),
('MRT', 'AR'),
('BHR', 'AR'),
('IRQ', 'AR'),
('KWT', 'AR'),
('JOR', 'AR'),
('LBN', 'AR'),
('OMN', 'AR'),
('QAT', 'AR'),
('SAU', 'AR'),
('SYR', 'AR'),
('UAE', 'AR'),
('YEM', 'AR');
*/