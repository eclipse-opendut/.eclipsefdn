local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-opendut') {
  settings+: {
    dependabot_security_updates_enabled_for_new_repositories: false,
    description: "Test Electronic Control Units around the world in a transparent network.",
    members_can_change_project_visibility: false,
    name: "Eclipse openDuT",
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
      has_projects: true,
      has_discussions: true,
      has_wiki: false,
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      variables+: [
        orgs.newRepoVariable('OPENDUT_GH_RUNNER_SMALL') {
          value: '["ubuntu-latest"]',
        },
        orgs.newRepoVariable('OPENDUT_GH_RUNNER_LARGE') {
          value: '["ubuntu-latest"]',
        },
      ],
      topics+: [
        "automotive",
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: 1,
          requires_conversation_resolution: true,
          requires_status_checks: false,
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
