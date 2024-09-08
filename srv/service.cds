using { com.sat.task as db } from '../db/schema';

service Attachments {
    entity Employee as projection on db.Employee;
    entity Files as projection on db.Files;
    
    action uploadData(jsonData: String);
}

// Enable draft mode for the Employee entity
annotate Attachments.Employee with @odata.draft.enabled;

// Add annotations for Employee
annotate Attachments.Employee with @(
    UI.LineItem: [
        {
            Label: 'Name',
            Value: name
        },
        {
            Label: 'Department',
            Value: dept
        }
    ],
    UI.FieldGroup #Employee: {
        $Type: 'UI.FieldGroupType',
        Data: [
            {
                Label: 'Name',
                Value: name
            },
            {
                Label: 'Department',
                Value: dept
            }
        ]
    },
    UI.Facets: [
        {
            $Type: 'UI.ReferenceFacet',
            ID: 'EmployeeFacet',
            Label: 'Employee facets',
            Target: '@UI.FieldGroup#Employee'
        },
        // {
        //     $Type: 'UI.ReferenceFacet',
        //     ID: 'filesFacet',
        //     Label: 'Files',
        //     Target: 'files/@UI.LineItem' 
        // }
    ]
);

annotate Attachments.Files with @(
  UI.LineItem : [
        {
            Label: 'File Name',
            Value: fileName
        },
        {
            Label: 'Media Type',
            Value: mediaType
        },
        {
            Label: 'File Size',
            Value: size
        }
    ],
    UI.FieldGroup #Files: {
        $Type: 'UI.FieldGroupType',
        Data: [
            {
                Label: 'File Name',
                Value: fileName
            },
            {
                Label: 'Media Type',
                Value: mediaType
            },
            {
                Label: 'File Size',
                Value: size
            }
        ]
    },
        UI.Facets: [
        {
            $Type: 'UI.ReferenceFacet',
            ID: 'filesFacet',
            Label: 'Files facets',
            Target: '@UI.FieldGroup#Files'
        },]
);
