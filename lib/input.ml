open Cohttp
open Lwt
open Cohttp_lwt_unix


let do_download year day =
  let url = "https://adventofcode.com/" ^ year ^ "/day/" ^ day ^ "/input" in
  let token = Sys.getenv "ADVENT_SESSION_TOKEN" in
  let header = Header.add (Header.init ()) "Cookie" ("session=" ^ token) in
  Client.get ~headers:header (Uri.of_string url) >>= fun (_, body) ->
    Cohttp_lwt.Body.to_string body;
  ;;

let download year day =
  Lwt_main.run (do_download year day)
;;