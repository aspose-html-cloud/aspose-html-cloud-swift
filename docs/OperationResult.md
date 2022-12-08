## OperationResult

### Fields
| Field            | Type      | Description                                                                  |
|------------------|-----------|------------------------------------------------------------------------------|
| **code**         | Int32     | Http return code                                                             |
| **id**           | String    | Conversion Id                                                                |
| **status**       | String    | Conversion status ("pending", "running", "completed", "faulted", "canceled") |
| **description**  | String    | Description of error                                                         |
| **links**        | [String]? | Reserved                                                                     |
| **file**         | String    | Result file. Zip if multifile result                                         |
