# movie_app_clean
Movies app

```mermaid

erDiagram
    Users ||--o{ Posts : "author_ref"
    Posts ||--|{ Comments : "nested_subcollection"
    
    Users {
        string id
        string email
    }
    Posts {
        string id
        string title
    }



```
