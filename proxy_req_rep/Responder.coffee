zmq     = require 'zmq'

module.exports = class Responder

  constructor: ({dealer, response}) ->
    @socket = zmq.socket('rep').connect(dealer)
    @socket.on 'message', (m) =>
      @socket.send(response(m))