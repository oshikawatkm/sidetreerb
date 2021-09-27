require 'base64'
require 'openssl'

ec = OpenSSL::PKey::EC.new('secp256k1').generate_key
public_binary = ec.public_key.to_bn.to_s(2)
x, y = public_binary.unpack('xa32a32')
private_binary = ec.private_key.to_s(2)

key = {
  crv: 'secp256k1',
  d: Base64.urlsafe_encode64(private_binary, padding: false),
  kty: 'EC',
  x: Base64.urlsafe_encode64(x, padding: false),
  y: Base64.urlsafe_encode64(y, padding: false),
}
puts key
puts ec.private_key