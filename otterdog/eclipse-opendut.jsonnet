local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-opendut') {
  settings+: {
    dependabot_security_updates_enabled_for_new_repositories: false,
    description: "Test Electronic Control Units around the world in a transparent network.",
    members_can_change_project_visibility: false,
    members_can_change_repo_visibility: false,
    members_can_create_teams: false,
    members_can_delete_repositories: false,
    name: "Eclipse Opendut Project",
    packages_containers_internal: false,
    packages_containers_public: false,
    readers_can_create_discussions: true,
    two_factor_requirement: false,
    web_commit_signoff_required: false,
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
    },
  },
  _repositories+:: [
    orgs.newRepo('opendut') {
      description: "Test Electronic Control Units around the world in a transparent network.",
      private: true,
      has_issues: true,
      has_projects: false,
      has_discussions: false,
      has_wiki: false,
      is_template: false,
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      topics+: [
        "automotive",
      ],
      default_branch: "main",
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          allows_deletions: false,
          allows_force_pushes: false,
          requires_pull_request: true,
          required_approving_review_count: 1,
          requires_conversation_resolution: true,
          requires_status_checks: false,
          required_status_checks+: [],
        },
      ],
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
    },
    orgs.newRepo('.github') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
    },
  ],
}
