-module(erlzmq_nif).

-export([context/1,
         socket/4,
         bind/2,
         connect/2,
         send/3,
         recv/2,
         setsockopt/3,
         getsockopt/2,
         close/1,
         term/1,
         version/0]).

-on_load(init/0).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
-endif.

init() -&gt;
    case code:priv_dir(erlzmq) of
        Path when is_list(Path) -&gt;
            erlang:load_nif(filename:join([Path, "erlzmq_drv"]), []);
        {error, bad_name} -&gt;
            case code:which(erlzmq_nif) of
                Filename when is_list(Filename) -&gt;
                    erlang:load_nif(filename:join([filename:dirname(Filename),
                                                   "..","priv",
                                                   "erlzmq_drv"]), []);
                Reason when is_atom(Reason) -&gt;
                    {error, Reason}
            end
    end.

context(_Threads) -&gt;
    erlang:nif_error(not_loaded).

socket(_Context, _Type, _Active, _ActivePid) -&gt;
    erlang:nif_error(not_loaded).

bind(_Socket, _Endpoint) -&gt;
    erlang:nif_error(not_loaded).

connect(_Socket, _Endpoint) -&gt;
    erlang:nif_error(not_loaded).

send(_Socket, _Binary, _Flags) -&gt;
    erlang:nif_error(not_loaded).

recv(_Socket, _Flags) -&gt;
    erlang:nif_error(not_loaded).

setsockopt(_Socket, _OptionName, _OptionValue) -&gt;
    erlang:nif_error(not_loaded).

getsockopt(_Socket, _OptionName) -&gt;
    erlang:nif_error(not_loaded).

close(_Socket) -&gt;
    erlang:nif_error(not_loaded).

term(_Context) -&gt;
    erlang:nif_error(not_loaded).

version() -&gt;
    erlang:nif_error(not_loaded).
</pre></body></html>Ztext/plainUUTF-8_Jhttps://raw.githubusercontent.com/zeromq/erlzmq2/master/src/erlzmq_nif.erl    ( ? Q g � � ����             
              �