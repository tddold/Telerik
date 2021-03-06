﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _2.DescriptionAndNameOfAllCategories
{
    class DescriptionAndNameOfAllCategories
    {
        static void Main(string[] args)
        {
            string connectionString =
            "Data Source=(local);Initial Catalog=Northwind;"
            + "Integrated Security=true";

            // Provide the query string with a parameter placeholder. 
            string queryString =
                "SELECT CategoryName, Description FROM Categories";

            // Specify the parameter value. 
            int paramValue = 5;

            // Create and open the connection in a using block. This 
            // ensures that all resources will be closed and disposed 
            // when the code exits. 
            using (SqlConnection connection =
                new SqlConnection(connectionString))
            {
                // Create the Command and Parameter objects.
                SqlCommand command = new SqlCommand(queryString, connection);
                command.Parameters.AddWithValue("@pricePoint", paramValue);

                // Open the connection in a try/catch block.  
                // Create and execute the DataReader, writing the result 
                // set to the console window. 

                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    Console.WriteLine("Name --> {0}\nDescription -->{1}\n",
                        reader[0],reader[1]);
                }
                reader.Close();
                Console.ReadLine();
            }
        }
    }
}
