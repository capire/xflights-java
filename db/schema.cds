using { Currency, Country, cuid, sap.common.CodeList } from '@sap/cds/common';

namespace sap.capire.flights;

entity Airlines : cuid {
  name     : String;
  icon     : String;
  currency : Currency;
}

entity Airports : cuid {
  name    : String;
  city    : String;
  country : Country;
}

entity Connections {
  key ID      : String(11); // e.g. LH4711
  airline     : Association to Airlines;
  origin      : Association to Airports;
  destination : Association to Airports;
  departure   : Time;
  arrival     : Time;
  distance    : Integer; // in kilometers
}

entity Flights {
  key flight     : Association to Connections;
  key date       : Date;
  aircraft       : String;
  price          : Price;
  currency       : Currency;
  maximum_seats  : Integer;
  occupied_seats : Integer; // partly transactional
};

entity Supplements : cuid {
  type     : Association to SupplementTypes;
  descr    : localized String(1111);
  price    : Price;
  currency : Currency;
}

entity SupplementTypes : CodeList {
  key code : String(2) enum {
    Beverage = 'BV';
    Meal = 'ML';
    Luggage = 'LU';
    Extra = 'EX';
  }
}

type Price : Decimal(9,4);
