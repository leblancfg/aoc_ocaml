open Lwt
open Cohttp
open Cohttp_lwt_unix

let download_file url =
  let open Lwt.Infix in
  Client.get (Uri.of_string url) >>= fun (resp, body) ->
  let code = resp |> Response.status |> Code.code_of_status in
  Printf.printf "Response code: %d\n" code;
  Printf.printf "Headers: %s\n" (resp |> Response.headers |> Header.to_string);
  body |> Cohttp_lwt.Body.to_string >|= fun body ->
  print_endline ("Received body\n" ^ body);
  Lwt.return body

let run =
  let body = Lwt_main.run (download_file "http://example.com") in
  print_endline body
