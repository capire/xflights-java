namespace sap.capire.flights;

using from '@sap/cds/common';

using { Currency, Country };

/** Service for data integration */
@data.product : true
@hcql : true
@rest : true
@odata : true
@cds.external : 2
service data {
  @readonly : true
  entity Flights {
    key ID : String(11);
    airline : Association to Airlines;
    origin : Association to Airports;
    destination : Association to Airports;
    departure : Time;
    arrival : Time;
    distance : Integer;
    key date : Date;
    aircraft : String;
    price : Price(9, 4);
    @title : '{i18n>Currency}'
    @description : '{i18n>CurrencyCode.Description}'
    currency : Currency;
    maximum_seats : Integer;
    occupied_seats : Integer;
    @Core.Computed : true
    free_seats : Integer;
  };

  @outbound : true
  event Flights.Updated {
    flightNumber : String;
    flightDate : Date;
    occupied_seats : Integer;
    free_seats : Integer;
  };

  @readonly : true
  entity Airlines {
    key ID : UUID;
    name : String;
    icon : String;
    @title : '{i18n>Currency}'
    @description : '{i18n>CurrencyCode.Description}'
    currency : Currency;
  };

  @readonly : true
  entity Airports {
    key ID : UUID;
    name : String;
    city : String;
    @title : '{i18n>Country}'
    @description : '{i18n>CountryCode.Description}'
    country : Country;
  };

  @readonly : true
  entity Supplements {
    key ID : UUID;
    type : Association to SupplementTypes;
    descr : String(1111);
    price : Price(9, 4);
    @title : '{i18n>Currency}'
    @description : '{i18n>CurrencyCode.Description}'
    currency : Currency;
  };

  @cds.autoexposed : true
  @cds.autoexpose : true
  @cds.persistence.skip : 'if-unused'
  @cds.odata.valuelist : true
  entity SupplementTypes {
    @title : '{i18n>Name}'
    name : String(255);
    @title : '{i18n>Description}'
    descr : String(1000);
    key code : String(2) enum {
      Beverage = 'BV';
      Meal = 'ML';
      Luggage = 'LU';
      Extra = 'EX';
    };
  };

  aspect FlightKeys {
    flightNumber : String;
    flightDate : Date;
  };

  @inbound : true
  event BookingCreated {
    flightNumber : String;
    flightDate : Date;
    seats : many Integer;
  };

  @inbound : true
  event BookingCancelled {
    flightNumber : String;
    flightDate : Date;
    seats : many Integer;
  };
};

type Price : Decimal(9, 4);

