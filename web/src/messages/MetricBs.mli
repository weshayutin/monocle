(** metric.proto BuckleScript Encoding *)


(** {2 Protobuf JSON Encoding} *)

val encode_metric_info : MetricTypes.metric_info -> Js.Json.t Js.Dict.t
(** [encode_metric_info v dict] encodes [v] int the given JSON [dict] *)

val encode_list_request : MetricTypes.list_request -> Js.Json.t Js.Dict.t
(** [encode_list_request v dict] encodes [v] int the given JSON [dict] *)

val encode_list_response : MetricTypes.list_response -> Js.Json.t Js.Dict.t
(** [encode_list_response v dict] encodes [v] int the given JSON [dict] *)

val encode_trend : MetricTypes.trend -> Js.Json.t Js.Dict.t
(** [encode_trend v dict] encodes [v] int the given JSON [dict] *)

val encode_top : MetricTypes.top -> Js.Json.t Js.Dict.t
(** [encode_top v dict] encodes [v] int the given JSON [dict] *)

val encode_compute : MetricTypes.compute -> Js.Json.t Js.Dict.t
(** [encode_compute v dict] encodes [v] int the given JSON [dict] *)

val encode_get_request_options : MetricTypes.get_request_options -> Js.Json.t Js.Dict.t
(** [encode_get_request_options v dict] encodes [v] int the given JSON [dict] *)

val encode_get_request : MetricTypes.get_request -> Js.Json.t Js.Dict.t
(** [encode_get_request v dict] encodes [v] int the given JSON [dict] *)

val encode_info_request : MetricTypes.info_request -> Js.Json.t Js.Dict.t
(** [encode_info_request v dict] encodes [v] int the given JSON [dict] *)

val encode_histo_int : MetricTypes.histo_int -> Js.Json.t Js.Dict.t
(** [encode_histo_int v dict] encodes [v] int the given JSON [dict] *)

val encode_histo_float : MetricTypes.histo_float -> Js.Json.t Js.Dict.t
(** [encode_histo_float v dict] encodes [v] int the given JSON [dict] *)

val encode_histo_int_stat : MetricTypes.histo_int_stat -> Js.Json.t Js.Dict.t
(** [encode_histo_int_stat v dict] encodes [v] int the given JSON [dict] *)

val encode_histo_float_stat : MetricTypes.histo_float_stat -> Js.Json.t Js.Dict.t
(** [encode_histo_float_stat v dict] encodes [v] int the given JSON [dict] *)

val encode_term_count_int : MetricTypes.term_count_int -> Js.Json.t Js.Dict.t
(** [encode_term_count_int v dict] encodes [v] int the given JSON [dict] *)

val encode_terms_count_int : MetricTypes.terms_count_int -> Js.Json.t Js.Dict.t
(** [encode_terms_count_int v dict] encodes [v] int the given JSON [dict] *)

val encode_term_count_float : MetricTypes.term_count_float -> Js.Json.t Js.Dict.t
(** [encode_term_count_float v dict] encodes [v] int the given JSON [dict] *)

val encode_terms_count_float : MetricTypes.terms_count_float -> Js.Json.t Js.Dict.t
(** [encode_terms_count_float v dict] encodes [v] int the given JSON [dict] *)

val encode_get_response : MetricTypes.get_response -> Js.Json.t Js.Dict.t
(** [encode_get_response v dict] encodes [v] int the given JSON [dict] *)

val encode_info_response : MetricTypes.info_response -> Js.Json.t Js.Dict.t
(** [encode_info_response v dict] encodes [v] int the given JSON [dict] *)


(** {2 BS Decoding} *)

val decode_metric_info : Js.Json.t Js.Dict.t -> MetricTypes.metric_info
(** [decode_metric_info decoder] decodes a [metric_info] value from [decoder] *)

val decode_list_request : Js.Json.t Js.Dict.t -> MetricTypes.list_request
(** [decode_list_request decoder] decodes a [list_request] value from [decoder] *)

val decode_list_response : Js.Json.t Js.Dict.t -> MetricTypes.list_response
(** [decode_list_response decoder] decodes a [list_response] value from [decoder] *)

val decode_trend : Js.Json.t Js.Dict.t -> MetricTypes.trend
(** [decode_trend decoder] decodes a [trend] value from [decoder] *)

val decode_top : Js.Json.t Js.Dict.t -> MetricTypes.top
(** [decode_top decoder] decodes a [top] value from [decoder] *)

val decode_compute : Js.Json.t Js.Dict.t -> MetricTypes.compute
(** [decode_compute decoder] decodes a [compute] value from [decoder] *)

val decode_get_request_options : Js.Json.t Js.Dict.t -> MetricTypes.get_request_options
(** [decode_get_request_options decoder] decodes a [get_request_options] value from [decoder] *)

val decode_get_request : Js.Json.t Js.Dict.t -> MetricTypes.get_request
(** [decode_get_request decoder] decodes a [get_request] value from [decoder] *)

val decode_info_request : Js.Json.t Js.Dict.t -> MetricTypes.info_request
(** [decode_info_request decoder] decodes a [info_request] value from [decoder] *)

val decode_histo_int : Js.Json.t Js.Dict.t -> MetricTypes.histo_int
(** [decode_histo_int decoder] decodes a [histo_int] value from [decoder] *)

val decode_histo_float : Js.Json.t Js.Dict.t -> MetricTypes.histo_float
(** [decode_histo_float decoder] decodes a [histo_float] value from [decoder] *)

val decode_histo_int_stat : Js.Json.t Js.Dict.t -> MetricTypes.histo_int_stat
(** [decode_histo_int_stat decoder] decodes a [histo_int_stat] value from [decoder] *)

val decode_histo_float_stat : Js.Json.t Js.Dict.t -> MetricTypes.histo_float_stat
(** [decode_histo_float_stat decoder] decodes a [histo_float_stat] value from [decoder] *)

val decode_term_count_int : Js.Json.t Js.Dict.t -> MetricTypes.term_count_int
(** [decode_term_count_int decoder] decodes a [term_count_int] value from [decoder] *)

val decode_terms_count_int : Js.Json.t Js.Dict.t -> MetricTypes.terms_count_int
(** [decode_terms_count_int decoder] decodes a [terms_count_int] value from [decoder] *)

val decode_term_count_float : Js.Json.t Js.Dict.t -> MetricTypes.term_count_float
(** [decode_term_count_float decoder] decodes a [term_count_float] value from [decoder] *)

val decode_terms_count_float : Js.Json.t Js.Dict.t -> MetricTypes.terms_count_float
(** [decode_terms_count_float decoder] decodes a [terms_count_float] value from [decoder] *)

val decode_get_response : Js.Json.t Js.Dict.t -> MetricTypes.get_response
(** [decode_get_response decoder] decodes a [get_response] value from [decoder] *)

val decode_info_response : Js.Json.t Js.Dict.t -> MetricTypes.info_response
(** [decode_info_response decoder] decodes a [info_response] value from [decoder] *)
