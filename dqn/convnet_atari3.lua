--[[
Copyright (c) 2014 Google Inc.

See LICENSE file for full terms of limited license.
]]

require 'convnet'

return function(args)
    args.n_units        = {64, 64, 64}
    args.filter_size    = {8, 4, 3}
    args.filter_stride  = {4, 2, 1}
    args.n_hid          = {512}
    args.nl             = nn.Rectifier

    -- inception
    args.incepChannelSize = {{32, 48}, {24, 24}} -- output size of non 1x1
    args.incepReduceSize = {{48,64,32,32}, {48,64,32,32}}
    args.incepSize = {}
    args.incepSize[1] = args.n_units[1]
    for i=1,#args.incepChannelSize do
    	args.incepSize[i+1] = args.incepChannelSize[i][1] + args.incepChannelSize[i][2] + args.incepReduceSize[i][3] + args.incepReduceSize[i][4]
    end
    return create_network(args)
end

