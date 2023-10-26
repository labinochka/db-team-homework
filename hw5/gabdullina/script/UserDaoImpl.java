import java.sql.*;
import java.util.ArrayList;
import java.util.List;



public class UserDaoImpl implements Dao<User>{
    private final Connection connection = DatabaseConnection.getConnection();
    @Override
    public User getById(int id) {
        String sql = "SELECT * FROM my_cool_user WHERE id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                return resultSetToUser(resultSet);
            } else {
                return null;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<User> getAll() {
        List<User> users = new ArrayList<>();

        try (Statement statement = connection.createStatement()) {
            String sql = "SELECT * from my_cool_user";

            ResultSet resultSet = statement.executeQuery(sql);

            while (resultSet.next()) {
                User user = resultSetToUser(resultSet);

                users.add(user);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return users;
    }

    @Override
    public void insert(User user) {
        try {
            String sql = "insert into my_cool_user(" +
                    "last_name, " +
                    "first_name, " +
                    "middle_name, " +
                    "date_of_birth, " +
                    "profession_id, " +
                    "nationality, " +
                    "phone_number, " +
                    "email" +
                    ") values (?, ?, ?, ?, ?, ?, ?, ?)";
            saveUserData(user, sql);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    public void update(User user) {

    }

    @Override
    public void delete(User user) {
        String sql = "DELETE FROM my_cool_user WHERE id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, user.getId());
            statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    private User resultSetToUser(ResultSet resultSet) throws SQLException {
        int userId = resultSet.getInt("id");
        String lastName = resultSet.getString("last_name");
        String firstName = resultSet.getString("first_name");
        String middleName = resultSet.getString("middle_name");
        Date dateOfBirth = resultSet.getDate("date_of_birth");
        String professionId = resultSet.getString("profession_id");
        String nationality = resultSet.getString("nationality");
        String phoneNumber = resultSet.getString("phoneNumber");
        String email = resultSet.getString("email");


        return new User(userId, lastName, firstName, middleName, dateOfBirth, professionId, nationality, phoneNumber, email);
    }

    private void saveUserData(User user, String sql) throws SQLException {
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, user.getLastName());
            statement.setString(2, user.getFirstName());
            statement.setString(3, user.getMiddleName());
            statement.setDate(4, user.getDateOfBirth());
            statement.setString(5, user.getProfessionId());
            statement.setString(6, user.getNationality());
            statement.setString(7, user.getPhoneNumber());
            statement.setString(8, user.getEmail());

            statement.executeUpdate();
        }
    }
}
