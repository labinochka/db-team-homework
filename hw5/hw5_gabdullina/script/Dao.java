import java.util.List;

public interface Dao<T> {
    T getById(int id);
    List<T> getAll();

    void insert(T t);

    void update(T t);

    void delete(T t);
}
