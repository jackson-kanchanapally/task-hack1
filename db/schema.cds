namespace com.sat.task;

using {
    cuid,
    managed
} from '@sap/cds/common';


entity Employee : managed, cuid {
    name   : String(10);
    dept   : String(10);
    gender : String(10);
    files :  Association to many Files;
}

entity Files: cuid, managed{
    @Core.MediaType: mediaType 
    @Core.ContentDisposition.Filename: fileName 
    @Core.ContentDisposition.Type: 'inline'
    content: LargeBinary;
    @Core.IsMediaType: true
    mediaType: String;
    fileName: String;
    size: Integer;
    url: String;
}