import 'core-js/stable'
import 'regenerator-runtime/runtime'
require('@rails/ujs').start()
require('turbolinks').start()
require('@rails/activestorage').start()
require('channels')
global.I18n = require('i18n-js')
import 'bootstrap'
require('./static_pages/sidebar')
require('./notifications/notifications')
require('./schedules/schedules')
