# movie_app_clean
Movies app

```mermaid

erDiagram
    Users ||--o{ Posts : "author_ref"
    Posts ||--|{ Comments : "sub_subcollection"
    
    Users {
        string id
        string email
    }
    Posts {
        string id
        string title
    }

    Comments {
    string commentId
    string text
}

```
```mermaid
erDiagram
    %% One-to-Many Mandatory: Sub-collection
    PRODUCT ||--|{ VARIANT : "sub-collection"

    %% One-to-Many Optional: Reference
    USER ||--o{ ORDER : "places"

    %% One-to-One: Linked Document
    USER ||--|| SETTINGS : "has"
```
