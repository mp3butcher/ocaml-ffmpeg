exception Failure
exception Failure_msg of string

let () =
  Callback.register_exception "ffmpeg_exn_failure" Failure;
  Callback.register_exception "ffmpeg_exn_failure_msg" (Failure_msg "");

  
module Pixel_format = struct
  type t =
  | YUV420p
  | YUYV422
  | RGB24
  | BGR24
  | YUV422p
  | YUV444p
  | YUV410p
  | YUV411p
  | YUVJ422p
  | YUVJ444p
  | RGBA
  | BGRA

  external bits : t -> int = "ocaml_avutil_bits_per_pixel"

  let bits (*?(padding=true)*) p =
    let n = bits p in
    (* TODO: when padding is true we should add the padding *)
    n
end

module Channel_layout = struct
  type t =
  | CL_mono
  | CL_stereo
  | CL_2point1
  | CL_2_1
  | CL_surround
  | CL_3point1
  | CL_4point0
  | CL_4point1
  | CL_2_2
  | CL_quad
  | CL_5point0
  | CL_5point1
  | CL_5point0_back
  | CL_5point1_back
  | CL_6point0
  | CL_6point0_front
  | CL_hexagonal
  | CL_6point1
  | CL_6point1_back
  | CL_6point1_front
  | CL_7point0
  | CL_7point0_front
  | CL_7point1
  | CL_7point1_wide
  | CL_7point1_wide_back
  | CL_octagonal
  | CL_hexadecagonal
  | CL_stereo_downmix
end

module Sample_format = struct
  type t =
  | SF_U8
  | SF_S16
  | SF_S32
  | SF_FLT
  | SF_DBL
  | SF_U8P
  | SF_S16P
  | SF_S32P
  | SF_FLTP
  | SF_DBLP

external get_name : t -> string = "ocaml_avutil_get_sample_fmt_name"
end

type audio_format = {
  channel_layout : Channel_layout.t;
  sample_format : Sample_format.t;
  sample_rate : int
}
                    
module Audio_frame = struct
  type t
end

module Video_frame = struct
  type t
end

module Subtitle_frame = struct
  type t
end
