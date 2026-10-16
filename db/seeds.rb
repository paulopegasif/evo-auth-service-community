# This file seeds RBAC roles and permissions required by the application.

puts "🌱 Seeding Evo Auth Service (Community)..."

# Seed RBAC system
puts "📋 Seeding RBAC system..."
require_relative 'seeds/rbac'
puts "✅ Seeded RBAC system with roles, actions and permissions"
puts "   - Roles: #{Role.count}"
puts "   - Role Permission Actions: #{RolePermissionsAction.count}"

puts "🏢 Seeding account config..."
unless RuntimeConfig.account
  RuntimeConfig.set('account', {
    id: SecureRandom.uuid,
    name: ENV.fetch('ORGANIZATION_NAME', 'Evolution Community'),
    domain: ENV.fetch('ORGANIZATION_DOMAIN', 'localhost'),
    support_email: ENV.fetch('SUPPORT_EMAIL', 'support@evolution.com'),
    locale: ENV.fetch('DEFAULT_LOCALE', 'pt-BR'),
    status: 'active',
    features: {},
    settings: {},
    custom_attributes: {}
  })
end
puts "✅ Account config: #{RuntimeConfig.account['name']} (ID: #{RuntimeConfig.account['id']})"

puts ""
puts "🚀 Run the setup wizard at /setup to create the first admin user."
