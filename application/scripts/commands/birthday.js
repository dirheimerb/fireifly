const BaseCommand = require('../base-command.js')

class Birthday extends BaseCommand {
  static name = 'birthday'
  static ignoreImplicitWorkspace = true

  async exec () {
    this.npm.config.set('yes', true)
    return this.npm.exec('exec', ['@npmcli/npm-birthday'])
  }
}

module.exports = Birthday
