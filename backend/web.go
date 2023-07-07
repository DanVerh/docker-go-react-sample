package main

import (
	"fmt"
	/*"encoding/json"
	"log"
	"net/http"*/
	"database/sql"
	_ "github.com/lib/pq"
)

const (
	host     = "172.17.0.2"
	port     = 5432
	user     = "postgres"
	password = "admin"
	dbname   = "db"
  )

//func main() {
	//// Define a handler function for the GET request
	//http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		//// Set the CORS headers to allow all origins
		//w.Header().Set("Access-Control-Allow-Origin", "*")
		//w.Header().Set("Access-Control-Allow-Methods", "GET")
		//w.Header().Set("Access-Control-Allow-Headers", "Content-Type")

		//// Set the response content type to JSON
		//w.Header().Set("Content-Type", "application/json")

		//// Create a sample JSON response
		//response := map[string]interface{}{
			//"message": "Hello, Go!",
//		}

		//// Encode the response as JSON
		//jsonResponse, err := json.Marshal(response)

		//// Check for the errors
		//if err != nil {
			//http.Error(w, err.Error(), http.StatusInternalServerError)
//			return
//		}

		//// Write the JSON response
		//w.Write(jsonResponse)
//	})

	//// Start the server on port 8080
	//log.Println("Server listening on http://localhost:8080")
	//log.Fatal(http.ListenAndServe(":8080", nil))
//}

func main() {
	// Format connection string to DB
	psqlInfo := fmt.Sprintf("postgres://%v:%v@%v:%v/%v?sslmode=disable", 
		user,
        password,
        host,
        port,
        dbname)

	// Validate provided arguments for the connection
	db, err := sql.Open("postgres", psqlInfo)
	if err != nil {
  		panic(err)
	}
	defer db.Close()
	fmt.Println("DB connection arguments are valid")

	// Open the test connection to DB
	err = db.Ping()
	if err != nil {
  		panic(err)
	}
	fmt.Println("DB connection succeeded")
}