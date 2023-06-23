package kz.bitlab.techorda.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DBConnector
{
    private static Connection connection;

    static
    {
        try
        {
            Class.forName("org.postgresql.Driver");
            connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/JavaEE-bitlab",
                    "postgres",
                    "s63amg");
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }

    public static ArrayList<Items> allItems(String how)
    {
        ArrayList<Items> items = new ArrayList<>();
        try
        {
            PreparedStatement statement = null;
            if(how.isEmpty())
            {
                statement = connection.prepareStatement("select * from items");
            }
            else if(how.equals("pu"))
            {
                statement = connection.prepareStatement("select * from items order by price asc ");
            }
            else if(how.equals("pd"))
            {
                statement = connection.prepareStatement("select * from items order by price desc ");
            }
            assert statement != null;
            ResultSet resultSet = statement.executeQuery();
            while(resultSet.next())
            {
                Items item = new Items();
                item.setId(resultSet.getLong("id"));
                item.setName(resultSet.getString("name"));
                item.setDescription(resultSet.getString("description"));
                item.setPrice(resultSet.getDouble("price"));
                items.add(item);
            }
            statement.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return items;
    }

    public static User getUser(String email , String password)
    {
        User user = null;
        try
        {
            PreparedStatement statement = connection.prepareStatement("select * from users where email like ?");
            statement.setString(1,email);
            ResultSet resultSet = statement.executeQuery();
            if(resultSet.next())
            {
                if(resultSet.getString("password").equals(password))
                {
                    user = new User();
                    user.setFullName(resultSet.getString("full_name"));
                    user.setEmail(resultSet.getString("email"));
                }
            }
            statement.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return user;
    }
}
