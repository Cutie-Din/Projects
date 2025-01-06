# news_app_clean_architecture
-----------------------------------------------------------------------------------------------------
---------------------------------------------*Folder*------------------------------------------------


1. Tạo 1 folder [core/resources] nhằm nắm bắt trạng thái kết nối của dữ liệu.

2. Tạo [domain/entity] -> [domain/repository].

3. Tạo [data/model] extends [domain/entity], tạo Json để model có thể nhận dữ liệu.

4. Tạo [data/repository_implement] thì [data/repository_implement] sẽ implements từ [domain/repository] tương tác với [data/model] để truyền dữ liệu.

5. Tạo [data/data_sources_service] và áp dụng package [retrofit] để thực hiện các kết nối tới API.
    5.1. Tạo [core/constants] để ghi lại các constants liên quan đến kết nối API ví dụ: baseURL
    5.2 + 5.3. Tạo 1 part để có thể áp dụng tự động sinh cho package [retrofit], liên kết 1 hoặc các constants từ [core/constants] -> [data/data_sources_service] như: @RestAPI - @GET - @Query... -> nhập flutter pub run build_runner build để tạo file tự động sinh cho [retrofit].

6. Tạo một lớp trừu tượng usecase khung chuẩn ở [core/usecases].

7. Tạo usecase ở [domain/usecases].

---------------------------------------------------------------------------------------------------
---------------------------------------------*Bloc*------------------------------------------------
1. Khai báo các trạng thái trong Bloc: Loading - Done - Error
2. Khai báo các sự kiện thực hiện trong Bloc.
3. Khai báo các Bloc.

