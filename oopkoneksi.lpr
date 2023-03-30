program oopkoneksi;

{$mode objfpc}{$H+}
uses
Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ZConnection;   



type
 TConnection = class
  private
    FHostname: string;
    FPort: string;
    FDatabase: string;
    FUsername: string;
    FPassword: string;
    FConnection: TZConnection;
  public
    constructor Create(const AHostname, APort, ADatabase, AUsername, APassword: string);
    destructor Destroy; override;
    function Connect: Boolean;
    function Disconnect: Boolean;
    property Connection: TZConnection read FConnection;
  end;
implementation


constructor TConnection.Create(const AHostname, APort, ADatabase, AUsername, APassword: string);
begin
  FHostname := AHostname;
  FPort := APort;
  FDatabase := ADatabase;
  FUsername := AUsername;
  FPassword := APassword;
  FConnection := TZConnection.Create(nil);
  FConnection.Protocol := 'mysql-5';
  FConnection.HostName := FHostname;
  FConnection.Port := FPort;
  FConnection.Database := FDatabase;
  FConnection.User := FUsername;
  FConnection.Password := FPassword;
end;

destructor TConnection.Destroy;
begin
  FConnection.Free;
  inherited;
end;

function TConnection.Connect: Boolean;
begin
  Result := False;
  try
    FConnection.Connect;
    Result := True;
  except
    on E: Exception do
      raise Exception.Create('Error connecting to database: ' + E.Message);
  end;
end;

function TConnection.Disconnect: Boolean;
begin
  Result := False;
  try
    FConnection.Disconnect;
    Result := True;
  except
    on E: Exception do
      raise Exception.Create('Error disconnecting from database: ' + E.Message);
  end;
end;

end.
